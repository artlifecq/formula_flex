package org.mokylin.skin.app.taskDiailog
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarSkin;
	import org.mokylin.skin.component.text.TextBlankSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskDiailogStateListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnTask:feathers.controls.Button;

		public var labAcceptDialog:feathers.controls.TextArea;

		public var labBG:feathers.controls.UIAsset;

		public var labNPCName:feathers.controls.Label;

		public var scrollTaskList:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskDiailogStateListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 450;
			this.width = 360;
			this.elementsContent = [labBG_i(),scrollTaskList_i(),labNPCName_i(),labAcceptDialog_i(),btnTask_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnTask_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTask = temp;
			temp.name = "btnTask";
			temp.label = "完成任务";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 101;
			temp.x = 129.5;
			temp.y = 413;
			return temp;
		}

		private function labAcceptDialog_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labAcceptDialog = temp;
			temp.name = "labAcceptDialog";
			temp.height = 122;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.text = "ffff";
			temp.color = 0xDED8C7;
			temp.width = 319;
			temp.x = 24;
			temp.y = 38;
			return temp;
		}

		private function labBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			labBG = temp;
			temp.name = "labBG";
			temp.height = 402;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 360;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labNPCName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNPCName = temp;
			temp.name = "labNPCName";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "小双";
			temp.color = 0xE59507;
			temp.width = 300;
			temp.x = 25;
			temp.y = 19;
			return temp;
		}

		private function scrollTaskList_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrollTaskList = temp;
			temp.name = "scrollTaskList";
			temp.height = 382;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarSkin);
			temp.width = 345;
			temp.x = 7;
			temp.y = 10;
			return temp;
		}

	}
}