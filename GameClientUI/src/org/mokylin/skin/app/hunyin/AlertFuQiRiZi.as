package org.mokylin.skin.app.hunyin
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertFuQiRiZi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListRizi:feathers.controls.List;

		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var lbInfo:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertFuQiRiZi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 429;
			this.width = 625;
			this.elementsContent = [bg_i(),__AlertFuQiRiZi_UIAsset1_i(),__AlertFuQiRiZi_UIAsset2_i(),btnClose_i(),__AlertFuQiRiZi_UIAsset3_i(),lbInfo_i(),ListRizi_i(),__AlertFuQiRiZi_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListRizi_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListRizi = temp;
			temp.name = "ListRizi";
			temp.height = 330;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 597;
			temp.x = 14;
			temp.y = 43;
			return temp;
		}

		private function __AlertFuQiRiZi_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "<font color='#00dfff'>2017-6-19 09:36:31 </font>熬血红颜也TA的伴侣<font color='#00ff33'>洞房</font> 双方增加了<font color='#ffea00'>5000000</font>点亲密度";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 20;
			temp.y = 48;
			return temp;
		}

		private function __AlertFuQiRiZi_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 388;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 611;
			temp.x = 7;
			temp.y = 34;
			return temp;
		}

		private function __AlertFuQiRiZi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 339;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 601;
			temp.x = 12;
			temp.y = 38;
			return temp;
		}

		private function __AlertFuQiRiZi_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/hunyin/fuqirizhi.png";
			temp.x = 268;
			temp.y = 5;
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

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 593;
			temp.y = 5;
			return temp;
		}

		private function lbInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo = temp;
			temp.name = "lbInfo";
			temp.text = "离线期间无法记录对方进行的互动操作";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 508;
			temp.x = 20;
			temp.y = 388;
			return temp;
		}

	}
}