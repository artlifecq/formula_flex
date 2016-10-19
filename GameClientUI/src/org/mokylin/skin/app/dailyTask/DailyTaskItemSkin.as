package org.mokylin.skin.app.dailyTask
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_green2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DailyTaskItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnJoin:feathers.controls.Button;

		public var labLevel:feathers.controls.Label;

		public var labTaskCount:feathers.controls.Label;

		public var labTaskName:feathers.controls.Label;

		public var labTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DailyTaskItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 50;
			this.width = 360;
			this.elementsContent = [__DailyTaskItemSkin_UIAsset1_i(),labTaskName_i(),labLevel_i(),labTime_i(),btnJoin_i(),labTaskCount_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DailyTaskItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 50;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 360;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnJoin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJoin = temp;
			temp.name = "btnJoin";
			temp.label = "立即参加";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.x = 63;
			temp.y = 11;
			return temp;
		}

		private function labLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLevel = temp;
			temp.name = "labLevel";
			temp.text = "等级 111";
			temp.color = 0xE59507;
			temp.width = 80;
			temp.x = 149;
			temp.y = 4;
			return temp;
		}

		private function labTaskCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTaskCount = temp;
			temp.name = "labTaskCount";
			temp.text = "0/1";
			temp.width = 86;
			temp.x = 265;
			temp.y = 8;
			return temp;
		}

		private function labTaskName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTaskName = temp;
			temp.name = "labTaskName";
			temp.text = "偷猪";
			temp.color = 0xE59507;
			temp.width = 59;
			temp.x = 8;
			temp.y = 14;
			return temp;
		}

		private function labTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTime = temp;
			temp.name = "labTime";
			temp.text = "时间";
			temp.color = 0xE59507;
			temp.width = 146;
			temp.x = 151;
			temp.y = 29;
			return temp;
		}

	}
}