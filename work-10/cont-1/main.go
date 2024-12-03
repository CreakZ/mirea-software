package main

import (
	"cont-1/handlers"
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/greet", handlers.PingHandler)

	if err := r.Run(":8080"); err != nil {
		panic(fmt.Errorf("failed to start server: %w", err))
	}
}
