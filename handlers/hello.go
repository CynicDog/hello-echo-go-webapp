package handlers

import (
	"github.com/labstack/echo/v4"
	"net/http"
)

func HelloPage(c echo.Context) error {
	data := map[string]interface{}{
		"title": "Hello Page",
		"msg":   "Hello, Echo!",
	}
	return c.Render(http.StatusOK, "index.html", data)
}
