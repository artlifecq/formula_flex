package org.mokylin.skin.app.taskDiailog
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskDiailogPrizeListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var gridsBg:feathers.controls.UIAsset;

		public var gridsGroup:feathers.controls.Group;

		public var lbExp:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskDiailogPrizeListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 130;
			this.width = 576;
			this.elementsContent = [gridsBg_i(),__TaskDiailogPrizeListSkin_UIAsset1_i(),gridsGroup_i(),__TaskDiailogPrizeListSkin_UIAsset2_i(),__TaskDiailogPrizeListSkin_UIAsset3_i(),__TaskDiailogPrizeListSkin_UIAsset4_i(),__TaskDiailogPrizeListSkin_UIAsset5_i(),lbExp_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TaskDiailogPrizeListSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 8;
			return temp;
		}

		private function __TaskDiailogPrizeListSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/npc/exp.png";
			temp.x = 9;
			temp.y = 21;
			return temp;
		}

		private function __TaskDiailogPrizeListSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/npc/xz_award.png";
			temp.x = 236;
			temp.y = 0;
			return temp;
		}

		private function __TaskDiailogPrizeListSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/npc/xuanze.png";
			temp.x = 9;
			temp.y = 76;
			return temp;
		}

		private function __TaskDiailogPrizeListSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/fenge1.png";
			temp.x = 123;
			temp.y = 10;
			return temp;
		}

		private function __TaskDiailogPrizeListSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/fenge2.png";
			temp.x = 336;
			temp.y = 11;
			return temp;
		}

		private function gridsBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gridsBg = temp;
			temp.name = "gridsBg";
			temp.styleName = "ui/app/npc/xzbg.png";
			temp.width = 494;
			temp.x = 11;
			temp.y = 56;
			return temp;
		}

		private function gridsGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gridsGroup = temp;
			temp.name = "gridsGroup";
			temp.height = 55;
			temp.width = 346;
			temp.x = 78;
			temp.y = 66;
			temp.layout = __TaskDiailogPrizeListSkin_HorizontalLayout1_i();
			return temp;
		}

		private function lbExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbExp = temp;
			temp.name = "lbExp";
			temp.bold = false;
			temp.height = 28;
			temp.leading = 5;
			temp.letterSpacing = NaN;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "任务面板";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 344;
			temp.x = 80;
			temp.y = 23;
			return temp;
		}

	}
}