package org.mokylin.skin.mainui.tishi
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuoDe_ZhuangBei2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icbg0:feathers.controls.UIAsset;

		public var Icbg1:feathers.controls.UIAsset;

		public var Icbg2:feathers.controls.UIAsset;

		public var Icbg3:feathers.controls.UIAsset;

		public var Icbg4:feathers.controls.UIAsset;

		public var Icbg5:feathers.controls.UIAsset;

		public var Icbg6:feathers.controls.UIAsset;

		public var Icbg7:feathers.controls.UIAsset;

		public var Icbg8:feathers.controls.UIAsset;

		public var Icbg9:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var imgBG:feathers.controls.UIAsset;

		public var weapons:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuoDe_ZhuangBei2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 192;
			this.width = 380;
			this.elementsContent = [imgBG_i(),weapons_i(),__HuoDe_ZhuangBei2_Group1_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icbg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg0 = temp;
			temp.name = "Icbg0";
			temp.styleName = "ui/common/grid/equip/02juanjia.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function Icbg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg1 = temp;
			temp.name = "Icbg1";
			temp.styleName = "ui/common/grid/equip/01wuqi.png";
			temp.x = 0;
			temp.y = 67;
			return temp;
		}

		private function Icbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg2 = temp;
			temp.name = "Icbg2";
			temp.styleName = "ui/common/grid/equip/04jiezhi.png";
			temp.x = 68;
			temp.y = 0;
			return temp;
		}

		private function Icbg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg3 = temp;
			temp.name = "Icbg3";
			temp.styleName = "ui/common/grid/equip/03toukui.png";
			temp.x = 68;
			temp.y = 67;
			return temp;
		}

		private function Icbg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg4 = temp;
			temp.name = "Icbg4";
			temp.styleName = "ui/common/grid/equip/06xianglian.png";
			temp.x = 136;
			temp.y = 0;
			return temp;
		}

		private function Icbg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg5 = temp;
			temp.name = "Icbg5";
			temp.styleName = "ui/common/grid/equip/05yifu.png";
			temp.x = 136;
			temp.y = 67;
			return temp;
		}

		private function Icbg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg6 = temp;
			temp.name = "Icbg6";
			temp.styleName = "ui/common/grid/equip/08shouzhuo.png";
			temp.x = 203;
			temp.y = 0;
			return temp;
		}

		private function Icbg7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg7 = temp;
			temp.name = "Icbg7";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 203;
			temp.y = 67;
			return temp;
		}

		private function Icbg8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg8 = temp;
			temp.name = "Icbg8";
			temp.styleName = "ui/common/grid/equip/10yupei.png";
			temp.x = 271;
			temp.y = 0;
			return temp;
		}

		private function Icbg9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg9 = temp;
			temp.name = "Icbg9";
			temp.styleName = "ui/common/grid/equip/09xiezi.png";
			temp.x = 271;
			temp.y = 67;
			return temp;
		}

		private function __HuoDe_ZhuangBei2_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 76;
			temp.y = 17;
			temp.elementsContent = [__HuoDe_ZhuangBei2_UIAsset1_i(),__HuoDe_ZhuangBei2_UIAsset2_i(),__HuoDe_ZhuangBei2_UIAsset3_i()];
			return temp;
		}

		private function __HuoDe_ZhuangBei2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_3.png";
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function __HuoDe_ZhuangBei2_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/common/wenshi/huawen_3.png";
			temp.x = 228;
			temp.y = 2;
			return temp;
		}

		private function __HuoDe_ZhuangBei2_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/tishi/chuangdai.png";
			temp.x = 63;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.x = 358;
			temp.y = 8;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 192;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 380;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function weapons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			weapons = temp;
			temp.name = "weapons";
			temp.x = 27;
			temp.y = 50;
			temp.elementsContent = [Icbg0_i(),Icbg1_i(),Icbg2_i(),Icbg3_i(),Icbg4_i(),Icbg5_i(),Icbg6_i(),Icbg7_i(),Icbg8_i(),Icbg9_i()];
			return temp;
		}

	}
}