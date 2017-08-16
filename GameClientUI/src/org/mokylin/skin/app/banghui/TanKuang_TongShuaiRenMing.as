package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TanKuang_TongShuaiRenMing extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var chkLead:feathers.controls.Check;

		public var chkMember:feathers.controls.Check;

		public var lbLead:feathers.controls.Label;

		public var lbMember:feathers.controls.Label;

		public var lbMsg:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TanKuang_TongShuaiRenMing()
		{
			super();
			
			this.currentState = "normal";
			this.height = 291;
			this.width = 580;
			this.elementsContent = [bg_i(),__TanKuang_TongShuaiRenMing_UIAsset1_i(),btnClose_i(),btnOk_i(),__TanKuang_TongShuaiRenMing_UIAsset2_i(),__TanKuang_TongShuaiRenMing_UIAsset3_i(),lbMsg_i(),chkLead_i(),lbLead_i(),__TanKuang_TongShuaiRenMing_Label1_i(),chkMember_i(),lbMember_i(),__TanKuang_TongShuaiRenMing_Label2_i(),__TanKuang_TongShuaiRenMing_UIAsset4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TanKuang_TongShuaiRenMing_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "皇城争霸中拥有统帅技能，独挡一面，万夫莫敌的关键成员";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 146;
			temp.y = 84;
			return temp;
		}

		private function __TanKuang_TongShuaiRenMing_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派奋战中的一员";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 146;
			temp.y = 120;
			return temp;
		}

		private function __TanKuang_TongShuaiRenMing_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 195;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 566;
			temp.x = 6;
			temp.y = 34;
			return temp;
		}

		private function __TanKuang_TongShuaiRenMing_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 36;
			temp.styleName = "ui/common/table/list1.png";
			temp.width = 548;
			temp.x = 15;
			temp.y = 75;
			return temp;
		}

		private function __TanKuang_TongShuaiRenMing_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 36;
			temp.styleName = "ui/common/table/list1.png";
			temp.width = 548;
			temp.x = 15;
			temp.y = 147;
			return temp;
		}

		private function __TanKuang_TongShuaiRenMing_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/banghui/word/head_tongshuairenming.png";
			temp.x = 247;
			temp.y = 8;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 291;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 578;
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
			temp.x = 545;
			temp.y = 5;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "确定";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 245;
			temp.y = 236;
			return temp;
		}

		private function chkLead_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkLead = temp;
			temp.name = "chkLead";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 26;
			temp.y = 82;
			return temp;
		}

		private function chkMember_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkMember = temp;
			temp.name = "chkMember";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 26;
			temp.y = 118;
			return temp;
		}

		private function lbLead_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLead = temp;
			temp.name = "lbLead";
			temp.text = "统帅(1/2)";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 60;
			temp.y = 84;
			return temp;
		}

		private function lbMember_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMember = temp;
			temp.name = "lbMember";
			temp.text = "非统帅";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 60;
			temp.y = 120;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.text = "你要任命玩家名称六字为统帅？";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 190;
			temp.y = 48;
			return temp;
		}

	}
}