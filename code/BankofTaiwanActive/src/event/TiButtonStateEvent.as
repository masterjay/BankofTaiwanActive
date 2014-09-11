package event
{
	
	
	public class TiButtonStateEvent extends TiBasicEvent
	{
		public static var BUTTON_EVENT:String = "BUTTON_EVENT";
		public static var BUTTON_EVENT_DISPLAY_TOOPTIP:String = "BUTTON_EVENT_DISPLAY_TOOPTIP";
		public static var BUTTON_EVENT_REMOVE_TOOPTIP:String = "BUTTON_EVENT_REMOVE_TOOPTIP";
		public static var BUTTON_EVENT_ROLLOVER_EVENT:String = "BUTTON_EVENT_ROLLOVER_EVENT";
		public static var BUTTON_EVENT_MOUSE_CLICK_EVENT:String = "BUTTON_EVENT_MOUSE_CLICK_EVENT";
		public var m_obj:Object = new Object();
		public var m_nX:Number;
		public var m_nY:Number;
		public var m_strMsg:String;
		public function TiButtonStateEvent(type:String, detail:String = "")
		{
			super(type,detail);
		}

	}
}