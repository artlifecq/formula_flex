package org.mokylin.skin.app.showgirl
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.showgirl.button.ButtonShowchongzhi;
	import org.mokylin.skin.app.showgirl.button.ButtonShowlingqu;
	import org.mokylin.skin.app.showgirl.number.UINumberShowQQ;
	import org.mokylin.skin.common.TongYongPanelbg1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShowGirl_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnChongzhi:feathers.controls.Button;

		public var btnLingqu:feathers.controls.Button;

		public var grpImg:feathers.controls.Group;

		public var grpQQ:feathers.controls.Group;

		public var imgGirl:feathers.controls.UIAsset;

		public var numQQ:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShowGirl_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__ShowGirl_Skin_UIAsset1_i(),__ShowGirl_Skin_UIAsset2_i(),imgGirl_i(),__ShowGirl_Skin_UIAsset3_i(),btnChongzhi_i(),btnLingqu_i(),grpImg_i(),grpQQ_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShowGirl_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __ShowGirl_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/showgirl/bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __ShowGirl_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/showgirl/chaojihuiyuan.png";
			temp.x = 430;
			temp.y = 18;
			return temp;
		}

		private function __ShowGirl_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/showgirl/mazuchongzhitiaojian.png";
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function __ShowGirl_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/showgirl/meinvkefuQQ.png";
			temp.x = 164;
			temp.y = 0;
			return temp;
		}

		private function __ShowGirl_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/showgirl/meinvkefuQQ.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnChongzhi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChongzhi = temp;
			temp.name = "btnChongzhi";
			temp.styleClass = org.mokylin.skin.app.showgirl.button.ButtonShowchongzhi;
			temp.x = 638;
			temp.y = 394;
			return temp;
		}

		private function btnLingqu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLingqu = temp;
			temp.name = "btnLingqu";
			temp.styleClass = org.mokylin.skin.app.showgirl.button.ButtonShowlingqu;
			temp.x = 638;
			temp.y = 394;
			return temp;
		}

		private function grpImg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpImg = temp;
			temp.name = "grpImg";
			temp.x = 110;
			temp.y = 543;
			temp.elementsContent = [__ShowGirl_Skin_UIAsset4_i(),__ShowGirl_Skin_UIAsset5_i()];
			return temp;
		}

		private function grpQQ_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpQQ = temp;
			temp.name = "grpQQ";
			temp.x = 103;
			temp.y = 543;
			temp.elementsContent = [__ShowGirl_Skin_UIAsset6_i(),numQQ_i()];
			return temp;
		}

		private function imgGirl_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgGirl = temp;
			temp.name = "imgGirl";
			temp.height = 311;
			temp.width = 400;
			temp.x = 72;
			temp.y = 221;
			return temp;
		}

		private function numQQ_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numQQ = temp;
			temp.name = "numQQ";
			temp.gap = -2;
			temp.height = 25;
			temp.label = "213097083";
			temp.styleClass = org.mokylin.skin.app.showgirl.number.UINumberShowQQ;
			temp.width = 50;
			temp.x = 157;
			temp.y = 2;
			return temp;
		}

	}
}