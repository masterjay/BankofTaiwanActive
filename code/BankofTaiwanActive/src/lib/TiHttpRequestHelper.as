package lib
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import mx.core.FlexGlobals;

	public class TiHttpRequestHelper extends URLLoader
	{
		//include "../Version.as";
		private var m_bDebug:Boolean = true;
		public var m_vars:URLVariables = null;
		public function TiHttpRequestHelper(request:URLRequest=null)
		{
			super(request);
			this.addEventListener( IOErrorEvent.IO_ERROR, fnOnIOError );
			if(m_bDebug)
			{
				this.addEventListener(Event.COMPLETE,fnOnComplete);
			}
		}
		
		public function fnSendRequest(url:String, vars:URLVariables =  null):void
		{			
			if(url == null || url =="")
			{
				return;
			}
			var request:URLRequest = new URLRequest(url);
			if(vars == null)
			{
				
				m_vars = new URLVariables()
			}
			else
			{
				m_vars = vars;
			}
			if(m_bDebug)
			{
				trace("call fnSendRequest:url:" +url);
				trace("vars:" +m_vars.toString());
			}
			m_vars.tick = Number(new Date().getTime());
			
			
			if(FlexGlobals.topLevelApplication != null)
			{
				if(FlexGlobals.topLevelApplication.parameters != null)
				{
					if(FlexGlobals.topLevelApplication.parameters.ssoKey != null)
					{
						m_vars.p = FlexGlobals.topLevelApplication.parameters.ssoKey.toString().substr(0,10);
					}
					else if(FlexGlobals.topLevelApplication.parameters.sessionRef != null)
					{
						m_vars.p = FlexGlobals.topLevelApplication.parameters.sessionRef.toString();
					}
				}
			}

			request.method = URLRequestMethod.POST;

			request.data = m_vars;
			this.load(request);
		}
		private function fnOnComplete(event:Event):void
		{	
			// cannot use this since sometimes server return non-xml data
			//var xml:XML = new XML(event.currentTarget.data);
			trace("TiHttpRequestHelper Received:\n"+ event.currentTarget.data);
		}
		
		private function fnOnIOError( event: Event ): void 
		{
			trace("TiHttpRequestHelper fnOnIOError:\n"+ event.currentTarget.data);
		}
	}
}