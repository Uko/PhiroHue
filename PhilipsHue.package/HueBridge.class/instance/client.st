helpers
client

	^ ZnClient new
    	host: ip;
    	enforceHttpSuccess: true;
    	accept: ZnMimeType applicationJson;
    	contentWriter: [ :object | 
			self znEntityFor: object ];
    	contentReader: [ :entity |
        NeoJSONReader fromString: entity contents ];
    	yourself.