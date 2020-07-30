# Dockerプロジェクトを起動する。
.PHONY: up
up:
	docker-compose up

sh:
	docker-compose exec php ash

# composer install を実行する
.PHONY: composer
composer:
	docker-compose run --rm composer install

# システムのyarnを利用して、yarnとyarn watchを実行する
.PHONY: yarn
yarn:
	cd backend; yarn && yarn watch

# Dockerを利用して、yarnとyarn watcを実行する
.PHONY: yarn-dc
yarn-dc:
	docker run --rm \
		--volume $(PWD)/backend:/backend \
		--workdir /backend \
		node:12.18.1-alpine yarn && yarn run watch

# Laravelプロジェクトを生成する
.PHONY: create-project
create-project:
	docker run --rm \
		--volume $(PWD):/app:cached \
		composer:latest sh -c "composer config -g repos.packagist composer https://packagist.jp \
		&& composer create-project --prefer-dist laravel/laravel backend -vvv"
