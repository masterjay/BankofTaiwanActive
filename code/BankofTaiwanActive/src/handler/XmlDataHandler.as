package handler
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLVariables;
	
	import event.TiBallotEvent;
	
	import lib.AppSetting;
	import lib.Ballot;
	import lib.TiHttpRequestHelper;
	

	public class XmlDataHandler extends EventDispatcher
	{
		
		public function XmlDataHandler()
		{
			
			
		}
		
		public function fnRequestXmlData():void
		{
			var httpHelper:lib.TiHttpRequestHelper=new TiHttpRequestHelper();
			httpHelper.addEventListener(Event.COMPLETE, fnGetXmlDataComplete);
			var httpVars:URLVariables=new URLVariables();
			//httpVars.productID=productID;
			//httpVars.dealerID=dealerID;
			httpHelper.fnSendRequest(AppSetting.GET_BALLOT, httpVars);
		}
		
		private function fnGetXmlDataComplete(e:Event):void
		{
			/*<output>
				<Ballot>3</Ballot>
				<AllTimes>10</AllTimes>
				<UsedTimes>3</UsedTimes>
				<CanUsedTimes>7</CanUsedTimes>
			 </output>*/
			var xml:XML = XML(e.currentTarget.data);
			
				trace(xml.children().length());
				var b:Ballot=new Ballot();
				b.m_Ballot=xml.output.Ballot;
				b.m_AllTimes=xml.output.AllTimes;
				b.m_UsedTimes=xml.output.UsedTimes;
				b.m_CanUsedTimes=xml.output.CanUsedTimes;
			
			
			
			var ev:TiBallotEvent = new TiBallotEvent(TiBallotEvent.GET_BALLOT_XML_DATA_EVENT)
				ev.m_ballot = b;
				dispatchEvent(ev);
		}
	}
}