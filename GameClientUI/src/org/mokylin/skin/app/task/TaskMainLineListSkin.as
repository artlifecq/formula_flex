package org.mokylin.skin.app.task
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarSkin;
	import org.mokylin.skin.component.text.TextBlankSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskMainLineListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgTaskBg:feathers.controls.UIAsset;

		public var labDecTitle:feathers.controls.Label;

		public var labPrizeTitle:feathers.controls.Label;

		public var labProgress:feathers.controls.Label;

		public var labTaskDec:feathers.controls.TextArea;

		public var labTaskName:feathers.controls.Label;

		public var labTaskPurposeTitle:feathers.controls.Label;

		public var scrollTaskList:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskMainLineListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 600;
			this.width = 868;
			this.elementsContent = [scrollTaskList_i(),imgTaskBg_i(),labTaskName_i(),labTaskPurposeTitle_i(),labPrizeTitle_i(),labDecTitle_i(),labTaskDec_i(),labProgress_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgTaskBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgTaskBg = temp;
			temp.name = "imgTaskBg";
			temp.height = 157;
			temp.width = 230;
			temp.x = 69;
			temp.y = 112;
			return temp;
		}

		private function labDecTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDecTitle = temp;
			temp.name = "labDecTitle";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "任务描述：";
			temp.color = 0xE59507;
			temp.width = 312;
			temp.x = 480;
			temp.y = 398;
			return temp;
		}

		private function labPrizeTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPrizeTitle = temp;
			temp.name = "labPrizeTitle";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "任务奖励：";
			temp.color = 0xE59507;
			temp.width = 312;
			temp.x = 480;
			temp.y = 212;
			return temp;
		}

		private function labProgress_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labProgress = temp;
			temp.name = "labProgress";
			temp.text = "1/10";
			temp.textAlign = "center";
			temp.width = 350;
			temp.x = 25;
			temp.y = 391;
			return temp;
		}

		private function labTaskDec_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labTaskDec = temp;
			temp.name = "labTaskDec";
			temp.height = 173;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.text = "量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在量在";
			temp.color = 0xDED8C7;
			temp.width = 375;
			temp.x = 481;
			temp.y = 422;
			return temp;
		}

		private function labTaskName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTaskName = temp;
			temp.name = "labTaskName";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "任务名字";
			temp.textAlign = "center";
			temp.color = 0xE59507;
			temp.width = 273;
			temp.x = 49;
			temp.y = 120;
			return temp;
		}

		private function labTaskPurposeTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTaskPurposeTitle = temp;
			temp.name = "labTaskPurposeTitle";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "任务目的：";
			temp.color = 0xE59507;
			temp.width = 341;
			temp.x = 480;
			temp.y = 123;
			return temp;
		}

		private function scrollTaskList_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrollTaskList = temp;
			temp.name = "scrollTaskList";
			temp.height = 177;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarSkin);
			temp.width = 374;
			temp.x = 10;
			temp.y = 419;
			return temp;
		}

	}
}