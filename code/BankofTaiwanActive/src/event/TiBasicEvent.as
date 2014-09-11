package event
{
	
	import flash.events.Event;
	
	//import base.TiCommonEventDispatcher;
	
	
	//import mx.messaging.channels.StreamingAMFChannel;

	public class TiBasicEvent extends flash.events.Event
	{
		public static const DUP_LOGIN_ERROR: String = "DUP_LOGIN_ERROR";
		public static const SESSION_TIMEOUT_WARNING: String = "SESSION_TIMEOUT_WARNING";
		public static const SESSION_TIMEOUT_ERROR: String = "SESSION_TIMEOUT_ERROR";
		
		private var m_strDetail:String;
		public var m_eventArgs: *;
		public var m_Obj:Object = new Object();

		public function get detail() : String
		{
			return this.m_strDetail;
		}


		public function TiBasicEvent(type:String, detail:String = "",bubbles:Boolean = false,cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			this.m_strDetail = detail;
		}
		/*public function fnBroadcast(): void 
		{
			TiCommonEventDispatcher.fnGetInstance().dispatchEvent( this );
		}*/
	}
}