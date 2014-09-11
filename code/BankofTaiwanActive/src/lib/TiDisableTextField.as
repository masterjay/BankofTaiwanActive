package lib 
{
	import flash.display.MovieClip;
	import flash.text.TextField;

	public class TiDisableTextField extends Object
	{
		public function TiDisableTextField()
		{
			super();
		}
		public static function fnEstablishDisableTextField(txtTextField:TextField):void
		{
			if(txtTextField == null)
			{
				txtTextField = new TextField();
			}
			txtTextField.selectable = false;
			txtTextField.mouseEnabled = false;
		}
		public static function fnDisableAllTextField(mc:MovieClip):void
		{
			var txt:Object;
			for (var i: int = 0; i < mc.numChildren; i++) 
			{
				txt = mc.getChildAt(i);
				if (txt is TextField) 
				{
					fnEstablishDisableTextField(TextField(txt));
					/*txt = new TextField();
					TextField(txt).selectable = false;
					TextField(txt).mouseEnabled = false;*/
				}
			}
		}
		
		public static function fnGetFirstTextField( mc: MovieClip ): TextField 
		{
			var txt:Object;
			for (var i: int = 0; i < mc.numChildren; i++) 
			{
				txt = mc.getChildAt(i);
				if (txt is TextField) 
				{
					return (txt as TextField);
				}
			}
			return null;
		}
		public static function fnSetButtonAndDisableAllTextField(mc:MovieClip,strTooltip:String=""):void
		{
			if(mc == null)
			{
				return;
			}
			var bs:TiButtonState = new TiButtonState()  ;
			bs.fnSetMcState(mc,strTooltip);
			var txt:Object;
			for (var i: int = 0; i < mc.numChildren; i++) 
			{
				txt = mc.getChildAt(i);
				if (txt is TextField) 
				{
					fnEstablishDisableTextField(TextField(txt));
					if(strTooltip!="")
					{
						TextField(txt).text = strTooltip;
						TextField(txt).selectable = false;
					}
					/*txt = new TextField();
					TextField(txt).selectable = false;
					TextField(txt).mouseEnabled = false;*/
				}
			}
		}
		public static function fnSetText(txtTextField:TextField,str:String): void 
		{	
			if(txtTextField==null)
			{
				return;
			}
			txtTextField.setSelection(0, 1);
			txtTextField.text = str;
			txtTextField.selectable = false;		
		}
		
		
		public static function fnSetTextFieldSingleOrMultiple(txtTextFieldSingle:TextField,txtTextFieldMultiple:TextField,text:String):void
		{
			txtTextFieldSingle.text =text
			if(txtTextFieldSingle.numLines>1)
			{
				fnSetText(txtTextFieldMultiple,text);
				txtTextFieldSingle.text="";
			}
			else
			{
				fnSetText(txtTextFieldSingle,text);
				txtTextFieldMultiple.text="";
			}
		}
	}
}