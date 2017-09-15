package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.Flip2_Skin;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhanBaoInfo extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose1:feathers.controls.Button;

		public var skinFlip:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhanBaoInfo()
		{
			super();
			
			this.currentState = "normal";
			this.height = 429;
			this.width = 625;
			this.elementsContent = [bg_i(),__ZhanBaoInfo_UIAsset1_i(),btnClose1_i(),__ZhanBaoInfo_Group1_i(),skinFlip_i(),__ZhanBaoInfo_UIAsset6_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZhanBaoInfo_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 12;
			temp.y = 41;
			temp.elementsContent = [__ZhanBaoInfo_UIAsset2_i(),__ZhanBaoInfo_UIAsset3_i(),__ZhanBaoInfo_UIAsset4_i(),__ZhanBaoInfo_UIAsset5_i(),__ZhanBaoInfo_Label1_i(),__ZhanBaoInfo_Label2_i(),__ZhanBaoInfo_Label3_i(),__ZhanBaoInfo_Label4_i()];
			return temp;
		}

		private function __ZhanBaoInfo_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "争夺城市";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 11;
			temp.y = 4;
			return temp;
		}

		private function __ZhanBaoInfo_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "争夺时间";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 131;
			temp.y = 4;
			return temp;
		}

		private function __ZhanBaoInfo_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "对症帮派";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 335;
			temp.y = 4;
			return temp;
		}

		private function __ZhanBaoInfo_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "胜负情况";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 516;
			temp.y = 4;
			return temp;
		}

		private function __ZhanBaoInfo_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 382;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 606;
			temp.x = 9;
			temp.y = 39;
			return temp;
		}

		private function __ZhanBaoInfo_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 86;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZhanBaoInfo_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 166;
			temp.x = 86;
			temp.y = 0;
			return temp;
		}

		private function __ZhanBaoInfo_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 233;
			temp.x = 252;
			temp.y = 0;
			return temp;
		}

		private function __ZhanBaoInfo_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 115;
			temp.x = 485;
			temp.y = 0;
			return temp;
		}

		private function __ZhanBaoInfo_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/banghui/zhenbabaoming.png";
			temp.x = 272;
			temp.y = 8;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 429;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 625;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose1 = temp;
			temp.name = "btnClose1";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 589;
			temp.y = 4;
			return temp;
		}

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.common.Flip2_Skin()
			temp.skin = skin
			temp.width = 148;
			temp.x = 239;
			temp.y = 394;
			return temp;
		}

	}
}