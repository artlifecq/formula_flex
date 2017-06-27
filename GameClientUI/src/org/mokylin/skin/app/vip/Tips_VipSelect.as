package org.mokylin.skin.app.vip
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
	public class Tips_VipSelect extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.Group;

		public var bg_huang:feathers.controls.UIAsset;

		public var bg_lan:feathers.controls.UIAsset;

		public var bg_zi:feathers.controls.UIAsset;

		public var lbDec:feathers.controls.Label;

		public var lbFang:feathers.controls.Label;

		public var lbGong:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbXue:feathers.controls.Label;

		public var lbl_titile:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_VipSelect()
		{
			super();
			
			this.currentState = "normal";
			this.height = 185;
			this.width = 280;
			this.elementsContent = [bg_i(),lbl_titile_i(),__Tips_VipSelect_UIAsset2_i(),lbGong_i(),lbFang_i(),lbXue_i(),lbTime_i(),lbDec_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_VipSelect_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/zhuangbei/bg_buttom1.png";
			temp.x = 0;
			temp.y = 159;
			return temp;
		}

		private function __Tips_VipSelect_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/pdzqsx.png";
			temp.x = 13;
			temp.y = 41;
			return temp;
		}

		private function bg_huang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_huang = temp;
			temp.name = "bg_huang";
			temp.height = 159;
			temp.styleName = "ui/common/tips/zhuangbei/bg_jin.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			bg = temp;
			temp.name = "bg";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__Tips_VipSelect_UIAsset1_i(),bg_lan_i(),bg_zi_i(),bg_huang_i()];
			return temp;
		}

		private function bg_lan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lan = temp;
			temp.name = "bg_lan";
			temp.height = 159;
			temp.styleName = "ui/common/tips/zhuangbei/bg_lan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_zi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_zi = temp;
			temp.name = "bg_zi";
			temp.height = 159;
			temp.styleName = "ui/common/tips/zhuangbei/bg_zi.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbDec_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDec = temp;
			temp.name = "lbDec";
			temp.text = "购买钻石VIP可提升至钻石墨者令";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 265;
			temp.x = 7.5;
			temp.y = 156;
			return temp;
		}

		private function lbFang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFang = temp;
			temp.name = "lbFang";
			temp.text = "防御：$";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 165;
			temp.x = 13;
			temp.y = 79;
			return temp;
		}

		private function lbGong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGong = temp;
			temp.name = "lbGong";
			temp.text = "攻击：$";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 165;
			temp.x = 13;
			temp.y = 60;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "66天06时02分20秒";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 198;
			temp.x = 41;
			temp.y = 123;
			return temp;
		}

		private function lbXue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXue = temp;
			temp.name = "lbXue";
			temp.text = "血量：$";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 165;
			temp.x = 13;
			temp.y = 99;
			return temp;
		}

		private function lbl_titile_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_titile = temp;
			temp.name = "lbl_titile";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "物品名字(居中)";
			temp.textAlign = "center";
			temp.color = 0x14A3F3;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 260;
			temp.x = 14;
			temp.y = 11;
			return temp;
		}

	}
}