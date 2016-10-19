package org.mokylin.skin.app.taskDiailog
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class NpcPlotDialogPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var labNpcName:feathers.controls.Label;

		public var labTaskDec:feathers.controls.Label;

		public var styleGroup_1:feathers.controls.Group;

		public var styleGroup_2:feathers.controls.Group;

		public var styleGroup_3:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function NpcPlotDialogPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 180;
			this.width = 628;
			this.elementsContent = [styleGroup_1_i(),styleGroup_2_i(),styleGroup_3_i(),labNpcName_i(),labTaskDec_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __NpcPlotDialogPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/dialog/ren-ming-bg.png";
			temp.x = 36;
			temp.y = 152;
			return temp;
		}

		private function __NpcPlotDialogPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/dialog/npc_bg3.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __NpcPlotDialogPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/dialog/npc_ming_bg.png";
			temp.x = 36;
			temp.y = 152;
			return temp;
		}

		private function __NpcPlotDialogPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/dialog/boss_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __NpcPlotDialogPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/dialog/boss_ming_bg.png";
			temp.x = 36;
			temp.y = 152;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/dialog/bg2.png";
			temp.x = 0;
			temp.y = 0;
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
			temp.x = 26;
			temp.y = 155;
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
			temp.width = 354;
			temp.x = 218;
			temp.y = 50;
			return temp;
		}

		private function styleGroup_1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			styleGroup_1 = temp;
			temp.name = "styleGroup_1";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [bg_i(),__NpcPlotDialogPanelSkin_UIAsset1_i()];
			return temp;
		}

		private function styleGroup_2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			styleGroup_2 = temp;
			temp.name = "styleGroup_2";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__NpcPlotDialogPanelSkin_UIAsset2_i(),__NpcPlotDialogPanelSkin_UIAsset3_i()];
			return temp;
		}

		private function styleGroup_3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			styleGroup_3 = temp;
			temp.name = "styleGroup_3";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__NpcPlotDialogPanelSkin_UIAsset4_i(),__NpcPlotDialogPanelSkin_UIAsset5_i()];
			return temp;
		}

	}
}