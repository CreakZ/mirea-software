package handlers

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

const (
	RUST_API_ENDPOINT = "http://rust:8081/greet"

	GOSTRING = "Hello from container #1 (go)"
)

type apiResponse struct {
	GoString   string    `json:"go_string"`
	RustString string    `json:"rust_string"`
	Time       time.Time `json:"time"`
}

type defaultResponse struct {
	Msg string `json:"msg"`
}

func newApiResponse(goString, rustString string) apiResponse {
	return apiResponse{
		GoString:   goString,
		RustString: rustString,
		Time:       time.Now(),
	}
}

func newDefaultResponse(msg string) defaultResponse {
	return defaultResponse{
		Msg: msg,
	}
}

func PingHandler(c *gin.Context) {
	rustResp, err := http.Get(RUST_API_ENDPOINT)
	if err != nil {
		c.AbortWithStatusJSON(
			http.StatusNotFound,
			newDefaultResponse("rust api is unavailable"),
		)
		return
	}

	if rustResp.StatusCode != http.StatusOK {
		c.AbortWithStatusJSON(
			http.StatusInternalServerError,
			newDefaultResponse(fmt.Sprintf("rust api returned error, status code: %d", rustResp.StatusCode)),
		)
		return
	}
	defer rustResp.Body.Close()

	body, err := io.ReadAll(rustResp.Body)
	if err != nil {
		c.AbortWithStatusJSON(
			http.StatusInternalServerError,
			newDefaultResponse(
				fmt.Sprintf("rust api sent incorrect response body, code %d", rustResp.StatusCode),
			))
		return
	}

	var defResp defaultResponse
	if err = json.Unmarshal(body, &defResp); err != nil {
		c.AbortWithStatusJSON(
			http.StatusInternalServerError,
			newDefaultResponse("failed to serialize response"),
		)
		return
	}

	c.JSON(http.StatusOK, newApiResponse(GOSTRING, defResp.Msg))
}
