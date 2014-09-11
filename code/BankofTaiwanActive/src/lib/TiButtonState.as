package lib
{
	
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import event.TiButtonStateEvent;

	
	public class TiButtonState extends Object
	{
		public static var m_EventDispatcher:EventDispatcher = new EventDispatcher();
		public function TiButtonState()
		{
			super();
		}
				
		public function fnSetMcState(mc:MovieClip,tip:String=""):void
		{
		//	TiUserInteractiveCollecter.instance.fnSpecificName(mc);
			mc.tipstr = tip;
			mc.buttonMode = true;
			mc.gotoAndStop(1);
			mc.selected = false;
			mc.disable = false;
			mc.addEventListener(MouseEvent.MOUSE_DOWN,mc_down);
			mc.addEventListener(MouseEvent.MOUSE_UP,mc_up);
			mc.addEventListener(MouseEvent.ROLL_OVER,mc_over);
			//mc.addEventListener(MouseEvent.MOUSE_MOVE,mc_move);
			mc.addEventListener(MouseEvent.ROLL_OUT,mc_out);
			mc.mouseChildren = false;
		}
		public function fnEnableMcState(mc:MovieClip):void
		{
			mc.buttonMode = true;
			mc.disable = false;
			mc.gotoAndStop(1);
		}
		public function fnDisableMcState(mc:MovieClip):void
		{
			mc.buttonMode = false;
			mc.disable = true;
			mc.gotoAndStop(1);
		}
		public function fnDisableAndDarkMcState(mc:MovieClip):void
		{
			mc.buttonMode = false;
			mc.disable = true;
			mc.gotoAndStop(4);
		}
		public static function addMyEventListener(...args):void
		{
			m_EventDispatcher.addEventListener(args[0],args[1],args[2]);
		}
		
		public static function dispatchMyEvent(tipstr:String,X:Number,Y:Number):void
		{
			var myEvent:event.TiButtonStateEvent = new TiButtonStateEvent(TiButtonStateEvent.BUTTON_EVENT_DISPLAY_TOOPTIP,null);
			myEvent.m_strMsg = tipstr;
			myEvent.m_nX = X;
			myEvent.m_nY = Y;
			m_EventDispatcher.dispatchEvent(myEvent);
		}
		
		public static function removeMyEventListener(...args):void
		{
			m_EventDispatcher.removeEventListener(args[0],args[1],args[2]);
		}
		
		
		private function mc_down(e:MouseEvent):void
		{
			
			var mc:MovieClip = MovieClip(e.currentTarget)
			if(mc.disable)
				return;
			mc.gotoAndStop(3);
			if(mc.tipstr !="")
			{
				fnChangeTooltip(mc);
			}
			
		//	TiUserInteractiveCollecter.instance.fnSave(event.target.name);
		}
		
		private function mc_up(e:MouseEvent):void
		{
			
			var mc:MovieClip = MovieClip(e.currentTarget)
			if(mc.disable)
				return;
			mc.gotoAndStop(2);
			if(mc.tipstr !="")
			{
				fnChangeTooltip(mc);
			}
		}
		
		private function mc_over(e:MouseEvent):void
		{
			var mc:MovieClip = MovieClip(e.currentTarget);
					
			if(mc.disable)
				return;
			if (! mc.seled)
			{
				mc.gotoAndStop(2);
				if(mc.tipstr !="")
				{
					fnChangeTooltip(mc);
				}
			}
			var myEvent:TiButtonStateEvent = new TiButtonStateEvent(TiButtonStateEvent.BUTTON_EVENT_ROLLOVER_EVENT,null);
			m_EventDispatcher.dispatchEvent(myEvent);
			
		}
		/*private function mc_move(event:MouseEvent):void
		{
			
			var mc:MovieClip = MovieClip(event.currentTarget);
			if(mc.disable)
				return;
			//dispatchMyEvent(mc.tipstr,event.stageX,event.stageY+mc.height);
		}*/
		private function mc_out(e:MouseEvent):void
		{
			var mc:MovieClip = MovieClip(e.currentTarget);
			if(mc.disable)
				return;
			//m_EventDispatcher.dispatchEvent(new TiButtonStateEvent(TiButtonStateEvent.BUTTON_EVENT_REMOVE_TOOPTIP,null));
			
			if (! mc.seled)
			{
				mc.gotoAndStop(1);
				if(mc.tipstr !="")
				{
					fnChangeTooltip(mc);
				}
			}
			else
			{
				//mc.gotoAndStop(3)
			}
		}
		private function fnChangeTooltip(mc:MovieClip):void
		{
			for (var i: int = 0; i < mc.numChildren; i++) 
			{
				var txt:Object;
				txt = mc.getChildAt(i);
				if (txt is TextField) 
				{
					if(mc.tipstr!="")
					{
						TextField(txt).text = mc.tipstr;
						TextField(txt).selectable = false;
					}
					/*txt = new TextField();
					TextField(txt).selectable = false;
					TextField(txt).mouseEnabled = false;*/
				}
			}
		}
	}
}