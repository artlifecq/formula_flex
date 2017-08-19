package org.mokylin.skin.app.mail
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.common.TongYongPanelbg3;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailRead_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.Button;

		public var btnTiqu:feathers.controls.Button;

		public var lbName:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbXiangqing:feathers.controls.Label;

		public var lbZhuti:feathers.controls.Label;

		public var vs_bar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailRead_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 586;
			this.width = 437;
			this.elementsContent = [__MailRead_Skin_SkinnableContainer1_i(),__MailRead_Skin_UIAsset1_i(),__MailRead_Skin_UIAsset2_i(),__MailRead_Skin_UIAsset3_i(),btnCancel_i(),btnTiqu_i(),__MailRead_Skin_UIAsset4_i(),__MailRead_Skin_UIAsset5_i(),__MailRead_Skin_UIAsset6_i(),__MailRead_Skin_UIAsset7_i(),__MailRead_Skin_UIAsset8_i(),__MailRead_Skin_UIAsset9_i(),lbName_i(),lbZhuti_i(),lbTime_i(),lbXiangqing_i(),__MailRead_Skin_UIAsset22_i(),vs_bar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MailRead_Skin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 586;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg3()
			temp.skin = skin
			temp.width = 437;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MailRead_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 440;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 404;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __MailRead_Skin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/mail/dqyj.png";
			temp.x = 173;
			temp.y = 16;
			return temp;
		}

		private function __MailRead_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 194;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 388;
			temp.x = 26;
			temp.y = 171;
			return temp;
		}

		private function __MailRead_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 118;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 388;
			temp.x = 26;
			temp.y = 397;
			return temp;
		}

		private function __MailRead_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mail/loumingtiao.png";
			temp.x = 28;
			temp.y = 90;
			return temp;
		}

		private function __MailRead_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mail/loumingtiao.png";
			temp.x = 28;
			temp.y = 119;
			return temp;
		}

		private function __MailRead_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mail/fajianren.png";
			temp.x = 32;
			temp.y = 95;
			return temp;
		}

		private function __MailRead_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mail/zhuti.png";
			temp.x = 32;
			temp.y = 124;
			return temp;
		}

		private function __MailRead_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mail/zhengyi.png";
			temp.x = 32;
			temp.y = 149;
			return temp;
		}

		private function __MailRead_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mail/fujian.png";
			temp.x = 32;
			temp.y = 373;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "删除";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 129;
			temp.y = 533;
			return temp;
		}

		private function btnTiqu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTiqu = temp;
			temp.name = "btnTiqu";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "提取附件";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 227;
			temp.y = 533;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "系统邮件";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 198;
			temp.x = 93;
			temp.y = 94;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.letterSpacing = -1;
			temp.text = "剩余时间：29天";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 313;
			temp.y = 94;
			return temp;
		}

		private function lbXiangqing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiangqing = temp;
			temp.name = "lbXiangqing";
			temp.height = 176;
			temp.leading = 18;
			temp.letterSpacing = 0;
			temp.text = "为了大虾更加茁长成长，附上一份新手礼包，愿大虾早日成就盖世豪侠";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 372;
			temp.x = 35;
			temp.y = 180;
			return temp;
		}

		private function lbZhuti_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhuti = temp;
			temp.name = "lbZhuti";
			temp.text = "新手礼包最大十个字";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 198;
			temp.x = 93;
			temp.y = 124;
			return temp;
		}

		private function vs_bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vs_bar = temp;
			temp.name = "vs_bar";
			temp.height = 108;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 28;
			temp.y = 403;
			return temp;
		}

	}
}