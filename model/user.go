package model

import (
	"time"

	"github.com/jmoiron/sqlx"
)

type User struct {
	ID      int        `db:"user_id" json:"id"`
	Name    string     `json:"name"`
	Created *time.Time `json:"created"`
	Updated *time.Time `json:"updated"`
}

func UsersAll(dbx *sqlx.DB) (users []User, err error) {
	if err := dbx.Select(&users, "select * from users"); err != nil {
		return nil, err
	}
	return users, nil
}
