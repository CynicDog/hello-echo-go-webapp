package routes

import (
	"github.com/CynicDog/hello-echo-go-webapp/handlers"
	"github.com/labstack/echo/v4"
)

func RegisterRoutes(e *echo.Echo) {
	e.GET("/", handlers.HelloPage)
}
