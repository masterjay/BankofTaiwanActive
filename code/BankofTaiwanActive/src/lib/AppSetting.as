package lib
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	import mx.controls.Alert;
	
	
	public class AppSetting
	{
		
	//	public static var DOMAIN:String = "http://haosen.drowl.com.tw/";
		public static var DOMAIN:String = "../";
		//public static var DOMAIN:String = "http://isabelle.drowl.com.tw/Mooncake2014/conn/";
	//	public static var GET_CUSTOMER_DATA:String  = "assets/customer.xml"		
		public static var STAGE_WIDTH:Number=0
		public static var STAGE_HEIGHT:Number=0
		public static var GET_BALLOT:String="";
		public static var GET_GAMELOG:String="";
		public static var DEFAULT_PAGE:String="";
		
		public function AppSetting()
		{
			
		}
		
		public static function set m_RootDomain(value:String):void 
		{
			DOMAIN = value;
			
				//http://isabelle.drowl.com.tw/Mooncake2014/conn/GetCount.aspx	
				//public
			GET_BALLOT			= DOMAIN + "GetBallot.aspx";
			GET_GAMELOG			= DOMAIN + "GetGameLog.aspx";
			DEFAULT_PAGE		= DOMAIN + "Default.aspx";
		}
		
		
		
	}
}