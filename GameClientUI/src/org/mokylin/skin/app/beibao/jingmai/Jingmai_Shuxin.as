package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Jingmai_Shuxin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var grpBianShi:feathers.controls.Group;

		public var grpXueWei:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Jingmai_Shuxin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 557;
			this.width = 292;
			this.elementsContent = [bg_i(),__Jingmai_Shuxin_UIAsset1_i(),__Jingmai_Shuxin_UIAsset2_i(),btnClose_i(),grpXueWei_i(),grpBianShi_i(),__Jingmai_Shuxin_Group1_i(),__Jingmai_Shuxin_Group2_i(),__Jingmai_Shuxin_UIAsset9_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Jingmai_Shuxin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 30;
			temp.y = 50;
			temp.elementsContent = [__Jingmai_Shuxin_UIAsset3_i(),__Jingmai_Shuxin_UIAsset4_i(),__Jingmai_Shuxin_UIAsset5_i()];
			return temp;
		}

		private function __Jingmai_Shuxin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 30;
			temp.y = 264;
			temp.elementsContent = [__Jingmai_Shuxin_UIAsset6_i(),__Jingmai_Shuxin_UIAsset7_i(),__Jingmai_Shuxin_UIAsset8_i()];
			return temp;
		}

		private function __Jingmai_Shuxin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 515;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 278;
			temp.x = 7;
			temp.y = 33;
			return temp;
		}

		private function __Jingmai_Shuxin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/beibao/jingmai/shuxingbeijing.jpg";
			temp.x = 11;
			temp.y = 37;
			return temp;
		}

		private function __Jingmai_Shuxin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/meishuzi/xueweijiachengshuxing.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function __Jingmai_Shuxin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 8;
			return temp;
		}

		private function __Jingmai_Shuxin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 8;
			return temp;
		}

		private function __Jingmai_Shuxin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/meishuzi/bianshijiachengshuxing.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function __Jingmai_Shuxin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 8;
			return temp;
		}

		private function __Jingmai_Shuxin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 8;
			return temp;
		}

		private function __Jingmai_Shuxin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/jingmai/jiachengzongshuxing.png";
			temp.x = 89;
			temp.y = 7;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 557;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 292;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 258;
			temp.y = 5;
			return temp;
		}

		private function grpBianShi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpBianShi = temp;
			temp.name = "grpBianShi";
			temp.width = 228;
			temp.x = 31;
			temp.y = 304;
			return temp;
		}

		private function grpXueWei_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpXueWei = temp;
			temp.name = "grpXueWei";
			temp.x = 31;
			temp.y = 87;
			return temp;
		}

	}
}