package org.mokylin.skin.app.dailyTask
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import org.mokylin.skin.component.text.TextBlankSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DailyTaskPrizeInfoSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labDec:feathers.controls.TextArea;

		public var labName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DailyTaskPrizeInfoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 355;
			this.width = 275;
			this.elementsContent = [labName_i(),__DailyTaskPrizeInfoSkin_Label1_i(),labDec_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DailyTaskPrizeInfoSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "奖励参考：";
			temp.color = 0x22A140;
			temp.width = 219;
			temp.x = 14;
			temp.y = 37;
			return temp;
		}

		private function labDec_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labDec = temp;
			temp.name = "labDec";
			temp.height = 142;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.text = "任务描述";
			temp.color = 0x22A140;
			temp.width = 251;
			temp.x = 14;
			temp.y = 203;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.text = "偷猪";
			temp.width = 210;
			temp.x = 14;
			temp.y = 12;
			return temp;
		}

	}
}