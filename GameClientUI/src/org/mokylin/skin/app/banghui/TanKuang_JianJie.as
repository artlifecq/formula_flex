package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TanKuang_JianJie extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var lbBangZhuName:feathers.controls.Label;

		public var lbBanghuiName:feathers.controls.Label;

		public var lbBanghuiNum:feathers.controls.Label;

		public var lbVip:feathers.controls.Label;

		public var lbXuanyan:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TanKuang_JianJie()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),__TanKuang_JianJie_UIAsset1_i(),btnOk_i(),__TanKuang_JianJie_Label1_i(),btnClose_i(),lbBanghuiName_i(),__TanKuang_JianJie_Label2_i(),lbBanghuiNum_i(),__TanKuang_JianJie_Label3_i(),__TanKuang_JianJie_Label4_i(),lbBangZhuName_i(),lbVip_i(),lbXuanyan_i(),__TanKuang_JianJie_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TanKuang_JianJie_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派名称：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 27;
			temp.y = 44;
			return temp;
		}

		private function __TanKuang_JianJie_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派人数：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 26;
			temp.y = 65;
			return temp;
		}

		private function __TanKuang_JianJie_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮主名称：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 26;
			temp.y = 87;
			return temp;
		}

		private function __TanKuang_JianJie_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派宣言：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 26;
			temp.y = 109;
			return temp;
		}

		private function __TanKuang_JianJie_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 73;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 297;
			temp.x = 15;
			temp.y = 131;
			return temp;
		}

		private function __TanKuang_JianJie_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/banghui/word/head_jianjie.png";
			temp.x = 119;
			temp.y = 8;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
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
			temp.x = 293;
			temp.y = 5;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "申请加入";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.width = 88;
			temp.x = 119;
			temp.y = 216;
			return temp;
		}

		private function lbBangZhuName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBangZhuName = temp;
			temp.name = "lbBangZhuName";
			temp.text = "帮主名称六字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 96;
			temp.x = 97;
			temp.y = 87;
			return temp;
		}

		private function lbBanghuiName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBanghuiName = temp;
			temp.name = "lbBanghuiName";
			temp.text = "帮派名称七个字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 119;
			temp.x = 97;
			temp.y = 43;
			return temp;
		}

		private function lbBanghuiNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBanghuiNum = temp;
			temp.name = "lbBanghuiNum";
			temp.text = "900/900";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 119;
			temp.x = 97;
			temp.y = 65;
			return temp;
		}

		private function lbVip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbVip = temp;
			temp.name = "lbVip";
			temp.text = "vip";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 204;
			temp.y = 87;
			return temp;
		}

		private function lbXuanyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXuanyan = temp;
			temp.name = "lbXuanyan";
			temp.height = 58;
			temp.text = "帮派宣言最多50个字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 278;
			temp.x = 26;
			temp.y = 138;
			return temp;
		}

	}
}