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
	public class TanKuang_ZhiWeiRenMing extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var chkBangzhu:feathers.controls.Check;

		public var chkFubangzhu:feathers.controls.Check;

		public var chkPutong:feathers.controls.Check;

		public var chkZhanglao:feathers.controls.Check;

		public var lbBangzhu:feathers.controls.Label;

		public var lbFubangzhu:feathers.controls.Label;

		public var lbMsg:feathers.controls.Label;

		public var lbPutong:feathers.controls.Label;

		public var lbZhanglao:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TanKuang_ZhiWeiRenMing()
		{
			super();
			
			this.currentState = "normal";
			this.height = 291;
			this.width = 580;
			this.elementsContent = [bg_i(),__TanKuang_ZhiWeiRenMing_UIAsset1_i(),btnClose_i(),btnOk_i(),__TanKuang_ZhiWeiRenMing_UIAsset2_i(),__TanKuang_ZhiWeiRenMing_UIAsset3_i(),lbMsg_i(),chkBangzhu_i(),lbBangzhu_i(),__TanKuang_ZhiWeiRenMing_Label1_i(),chkFubangzhu_i(),lbFubangzhu_i(),__TanKuang_ZhiWeiRenMing_Label2_i(),chkZhanglao_i(),lbZhanglao_i(),__TanKuang_ZhiWeiRenMing_Label3_i(),chkPutong_i(),lbPutong_i(),__TanKuang_ZhiWeiRenMing_Label4_i(),__TanKuang_ZhiWeiRenMing_UIAsset4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TanKuang_ZhiWeiRenMing_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拥有招收成员,逐出成员.任命成员,帮派升级,皇城争霸报名等权力";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 147;
			temp.y = 88;
			return temp;
		}

		private function __TanKuang_ZhiWeiRenMing_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拥有招收成员,逐出成员.任命成员,帮派升级,皇城争霸报名等权力";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 147;
			temp.y = 123;
			return temp;
		}

		private function __TanKuang_ZhiWeiRenMing_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拥有招收成员,逐出成员等权力";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 147;
			temp.y = 160;
			return temp;
		}

		private function __TanKuang_ZhiWeiRenMing_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "参与帮派活动,是帮派的一份子";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 147;
			temp.y = 198;
			return temp;
		}

		private function __TanKuang_ZhiWeiRenMing_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 194;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 566;
			temp.x = 6;
			temp.y = 34;
			return temp;
		}

		private function __TanKuang_ZhiWeiRenMing_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 36;
			temp.styleName = "ui/common/table/list1.png";
			temp.width = 548;
			temp.x = 15;
			temp.y = 75;
			return temp;
		}

		private function __TanKuang_ZhiWeiRenMing_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 36;
			temp.styleName = "ui/common/table/list1.png";
			temp.width = 548;
			temp.x = 15;
			temp.y = 147;
			return temp;
		}

		private function __TanKuang_ZhiWeiRenMing_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/banghui/word/head_zhiwei.png";
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
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确定";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 88;
			temp.x = 246;
			temp.y = 242;
			return temp;
		}

		private function chkBangzhu_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkBangzhu = temp;
			temp.name = "chkBangzhu";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 27;
			temp.y = 86;
			return temp;
		}

		private function chkFubangzhu_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkFubangzhu = temp;
			temp.name = "chkFubangzhu";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 27;
			temp.y = 121;
			return temp;
		}

		private function chkPutong_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkPutong = temp;
			temp.name = "chkPutong";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 27;
			temp.y = 196;
			return temp;
		}

		private function chkZhanglao_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkZhanglao = temp;
			temp.name = "chkZhanglao";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 27;
			temp.y = 158;
			return temp;
		}

		private function lbBangzhu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBangzhu = temp;
			temp.name = "lbBangzhu";
			temp.text = "帮主";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 61;
			temp.y = 88;
			return temp;
		}

		private function lbFubangzhu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFubangzhu = temp;
			temp.name = "lbFubangzhu";
			temp.text = "副帮主(1/2)";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 61;
			temp.y = 123;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.htmlText = "你想任命<font color='#5DBD37'>玩家名称六字</font>什么职位？";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 182;
			temp.y = 48;
			return temp;
		}

		private function lbPutong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPutong = temp;
			temp.name = "lbPutong";
			temp.text = "普通成员";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 61;
			temp.y = 198;
			return temp;
		}

		private function lbZhanglao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanglao = temp;
			temp.name = "lbZhanglao";
			temp.text = "长老(/1)";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 61;
			temp.y = 160;
			return temp;
		}

	}
}