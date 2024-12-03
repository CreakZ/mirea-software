use actix_web::{get, HttpServer, App, Responder, HttpResponse};
use serde::Serialize;

#[derive(Serialize)]
struct Response {
    msg: String
}

impl Response {
    pub fn new(msg: &str) -> Self {
        return Response{
            msg: msg.to_owned()
        }
    }
}

#[get("/greet")]
async fn greet() -> impl Responder {
    let resp = Response::new("Hello from container #2 (rust)");
    
    HttpResponse::Ok().json(resp)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| App::new().service(greet))
        .bind("0.0.0.0:8081")?
        .run()
        .await?;

    Ok(())
}
