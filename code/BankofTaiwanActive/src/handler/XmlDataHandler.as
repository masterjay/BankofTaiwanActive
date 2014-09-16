package handler
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLVariables;
	
	import event.TiBallotEvent;
	
	import lib.AppSetting;
	import lib.Ballot;
	import lib.GameLog;
	import lib.TiHttpRequestHelper;
	

	public class XmlDataHandler extends EventDispatcher
	{
		
		public function XmlDataHandler()
		{
			
			
		}
		
		public function fnRequestGameLog():void
		{
			var httpHelper:lib.TiHttpRequestHelper=new TiHttpRequestHelper();
			httpHelper.addEventListener(Event.COMPLETE, fnGetGameLogXmlDataComplete);
			var httpVars:URLVariables=new URLVariables();
			//httpVars.productID=productID;
			//httpVars.dealerID=dealerID;
			httpHelper.fnSendRequest(AppSetting.GET_GAMELOG, httpVars);
		}
		
		protected function fnGetGameLogXmlDataComplete(e:Event):void
		{
			// TODO Auto-generated method stub
			/*<?xml version="1.0" encoding="UTF-8"?>
			-<output>
				<alert/>
				<GameLogId>EB5190DD-C1C6-47BC-ABB0-DDBC6EE856E8</GameLogId>
			</output>*/
			
			/*<?xml version="1.0" encoding="UTF-8"?>
			-<output>
			<alert>您目前已選完抽籤機會!再去交易吧!</alert>
			<GameLogId>-1</GameLogId>
			</output>*/
			var xml:XML = XML(e.currentTarget.data);
			GameLog.m_strGameLogId = xml.GameLogId;
		//	GameLog.m_strGameLogId = "-1";
			if(GameLog.m_strGameLogId =="-1")
			{
				GameLog.m_strAlert  = xml.alert;
			//	GameLog.m_strAlert ="請至網銀登入後才可以進行遊戲喔!"
			}
			var ev:TiBallotEvent = new TiBallotEvent(TiBallotEvent.GET_GAMELOG_XML_DATA_EVENT)
				dispatchEvent(ev);
		}
		
		public function fnRequestXmlData():void
		{
			var httpHelper:lib.TiHttpRequestHelper=new TiHttpRequestHelper();
			httpHelper.addEventListener(Event.COMPLETE, fnGetXmlDataComplete);
			var httpVars:URLVariables=new URLVariables();
			httpVars.GLId=GameLog.m_strGameLogId;
			//httpVars.dealerID=dealerID;
			httpHelper.fnSendRequest(AppSetting.GET_BALLOT, httpVars);
		}
		
		private function fnGetXmlDataComplete(e:Event):void
		{
			
			/*-<output>
				<result>true</result>
				<alert/>
				<Ballot>5</Ballot>
				<AllTimes>9</AllTimes>
				<UsedTimes>8</UsedTimes>
				<CanUsedTimes>1</CanUsedTimes>
				<GameLogId>095B017B-9D51-4F32-83A7-9782D2723350</GameLogId>
			</output>*/
			
			var xml:XML = XML(e.currentTarget.data);
			
				//trace(xml.children().length());
				var b:Ballot=new Ballot();
				/*b.m_nBallot=8;
				b.m_AllTimes=5;
				b.m_UsedTimes=3;
				b.m_CanUsedTimes=0;*/
				b.m_nBallot=xml.Ballot;
				b.m_AllTimes=xml.AllTimes;
				b.m_UsedTimes=xml.UsedTimes;
				b.m_CanUsedTimes=xml.CanUsedTimes;
			
				GameLog.m_strAlert = xml.alert;
				GameLog.m_strGameLogId = xml.GameLogId;
			
			//	GameLog.m_strAlert = "error";
			//	GameLog.m_strGameLogId = "ddddwwww";
			var ev:TiBallotEvent = new TiBallotEvent(TiBallotEvent.GET_BALLOT_XML_DATA_EVENT)
				ev.m_ballot = b;
				dispatchEvent(ev);
		}
	}
}