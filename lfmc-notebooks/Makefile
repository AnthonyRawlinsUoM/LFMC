all: pull

build:
	@docker build --tag=anthonyrawlinsuom/lfmc-notebooks .
	
install:
	@docker push anthonyrawlinsuom/lfmc-notebooks
	
pull:
	@docker pull anthonyrawlinsuom/lfmc-notebooks

clean:
	@docker rmi --force anthonyrawlinsuom/lfmc-notebooks