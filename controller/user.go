package controller

import (
	"net/http"

	"github.com/jmoiron/sqlx"
	"github.com/voyagegroup/go-todo/model"
)

type User struct {
	DB *sqlx.DB
}

func (u *User) GetAll(w http.ResponseWriter, r *http.Request) error {
	users, err := model.UsersAll(u.DB)
	if err != nil {
		return err
	}
	return JSON(w, 200, users)
}
