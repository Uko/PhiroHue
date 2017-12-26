instance creation
findAndStoreDefaultIP
	"find a HueBridge in a local network and store it's IP"

	| possibleBridges client |
	possibleBridges := STON fromString:
		(ZnEasy get: 'https://www.meethue.com/api/nupnp') contents.
		
	client := ZnClient new
		path: '/api/config';
		method: #GET;
		timeout: 2;
		yourself.
		
	possibleBridges
		do: [ :bridge |
			| ip |
			ip := bridge at: #internalipaddress.
			[
				client host: ip.
				client execute.
				client isSuccess ifTrue: [
					^ defaultIP := ip ]
			 ] on: ConnectionTimedOut  do: [  ] ].