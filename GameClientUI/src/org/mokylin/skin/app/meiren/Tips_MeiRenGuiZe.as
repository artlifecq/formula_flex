package org.mokylin.skin.app.meiren
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
	public class Tips_MeiRenGuiZe extends feathers.controls.StateSkin
	{
		public var imgBG:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_MeiRenGuiZe()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imgBG_i(),__Tips_MeiRenGuiZe_Label1_i(),__Tips_MeiRenGuiZe_Label2_i(),__Tips_MeiRenGuiZe_Group1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_MeiRenGuiZe_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 10;
			temp.y = 40;
			temp.elementsContent = [__Tips_MeiRenGuiZe_UIAsset1_i(),__Tips_MeiRenGuiZe_UIAsset2_i(),__Tips_MeiRenGuiZe_UIAsset3_i(),__Tips_MeiRenGuiZe_UIAsset4_i(),__Tips_MeiRenGuiZe_UIAsset5_i(),__Tips_MeiRenGuiZe_UIAsset6_i(),__Tips_MeiRenGuiZe_UIAsset7_i(),__Tips_MeiRenGuiZe_UIAsset8_i(),__Tips_MeiRenGuiZe_UIAsset9_i()];
			return temp;
		}

		private function __Tips_MeiRenGuiZe_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "【玩法说明】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 5;
			temp.y = 11;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "美人系统设置多个美人<br>要获得美人需要挑战9个关卡<br>通关当前美人所有关卡可激活美人<br>中途退出再次挑战将从第一关开始<br>合理使用提升可极大提高自身通关的机会<br>关卡无进入次数限制，每日可无限挑战<br>获得美人可永久增加玩家属性<br>获得美人可出战辅助战斗<br>进阶美人可获得更高属性及提高美人技能效果";
			temp.leading = 4;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 20;
			temp.y = 35;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 0;
			temp.y = 35;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 0;
			temp.y = 53;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 0;
			temp.y = 72;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 0;
			temp.y = 90;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 0;
			temp.y = 107;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 0;
			temp.y = 125;
			return temp;
		}

		private function __Tips_MeiRenGuiZe_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 0;
			temp.y = 143;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 208;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 310;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}