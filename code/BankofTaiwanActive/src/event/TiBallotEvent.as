package event
{
	import lib.Ballot;
	import lib.GameLog;
	
	
	public class TiBallotEvent extends TiBasicEvent
	{
		public static var GET_GAMELOG_XML_DATA_EVENT:String = "GET_GAMELOG_XML_DATA_EVENT";
		public static var GET_BALLOT_XML_DATA_EVENT:String = "GET_BALLOT_XML_DATA_EVENT";
		public static var REQUEST_BALLOT_XML_DATA:String = "REQUEST_BALLOT_XML_DATA";
		public static var RESET_BALLOT_EVENT:String = "RESET_BALLOT_EVENT";
		public var m_ballot:Ballot = new Ballot();
		public function TiBallotEvent(type:String, detail:String = "")
		{
			super(type,detail);
		}

	}
}