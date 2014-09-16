package lib
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	
	public class AppSetting
	{
		
	//	public static var DOMAIN:String = "http://haosen.drowl.com.tw/";
		public static var DOMAIN:String = "../";
		//public static var DOMAIN:String = "http://isabelle.drowl.com.tw/Mooncake2014/conn/";
	//	public static var GET_CUSTOMER_DATA:String  = "assets/customer.xml"		
	
		public static var GET_BALLOT:String="";
		public static var GET_GAMELOG:String="";
		
		
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
				
		}
		
		
		
	}
}