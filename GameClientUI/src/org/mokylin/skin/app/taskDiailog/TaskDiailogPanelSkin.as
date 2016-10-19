package org.mokylin.skin.app.taskDiailog
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_big;
	import org.mokylin.skin.component.button.ButtonSkin_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskDiailogPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnAward:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var labNpcName:feathers.controls.Label;

		public var labTaskDec:feathers.controls.Label;

		public var shengYuDesc:feathers.controls.Label;

		public var shengYuTimes:feathers.controls.Label;

		public var skinableContainer:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskDiailogPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 349;
			this.width = 939;
			this.elementsContent = [bg_i(),btnClose_i(),labTaskDec_i(),labNpcName_i(),skinableContainer_i(),shengYuDesc_i(),shengYuTimes_i(),btnAward_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 349;
			temp.styleName = "ui/app/npc/bg.png";
			temp.width = 939;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnAward_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAward = temp;
			temp.name = "btnAward";
			temp.height = 31;
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_yellow2;
			temp.width = 90;
			temp.x = 665;
			temp.y = 240;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 37;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close_big;
			temp.width = 41;
			temp.x = 822;
			temp.y = 71;
			return temp;
		}

		private function labNpcName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNpcName = temp;
			temp.name = "labNpcName";
			temp.height = 23;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.letterSpacing = 1;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 172;
			temp.x = 89;
			temp.y = 275;
			return temp;
		}

		private function labTaskDec_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTaskDec = temp;
			temp.name = "labTaskDec";
			temp.bold = false;
			temp.height = 66;
			temp.htmlText = "任务面板<br>任务面板";
			temp.leading = 4;
			temp.letterSpacing = NaN;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 470;
			temp.x = 305;
			temp.y = 87;
			return temp;
		}

		private function shengYuDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			shengYuDesc = temp;
			temp.name = "shengYuDesc";
			temp.fontSize = 14;
			temp.text = "今日剩余进入次数：";
			temp.color = 0xDDDABA;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 300;
			temp.y = 214;
			return temp;
		}

		private function shengYuTimes_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			shengYuTimes = temp;
			temp.name = "shengYuTimes";
			temp.text = "标签";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 427;
			temp.y = 214;
			return temp;
		}

		private function skinableContainer_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinableContainer = temp;
			temp.name = "skinableContainer";
			temp.height = 135;
			temp.width = 600;
			temp.x = 300;
			temp.y = 154;
			return temp;
		}

	}
}