package org.mokylin.skin.app.tequan
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.tequan.button.ButtonChongzhi;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TQ_Tequanlibao extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var banner:feathers.controls.UIAsset;

		public var btnChongzhi:feathers.controls.Button;

		public var lbLv:feathers.controls.Label;

		public var lbPingtai:feathers.controls.Label;

		public var listCont:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TQ_Tequanlibao()
		{
			super();
			
			this.currentState = "normal";
			this.width = 706;
			this.elementsContent = [banner_i(),listCont_i(),__TQ_Tequanlibao_Label1_i(),lbLv_i(),btnChongzhi_i(),lbPingtai_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TQ_Tequanlibao_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "你当前的37平台会员等级：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 236;
			temp.y = 101;
			return temp;
		}

		private function banner_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			banner = temp;
			temp.name = "banner";
			temp.styleName = "ui/big_bg/tequan/banner_tequanlibao.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnChongzhi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChongzhi = temp;
			temp.name = "btnChongzhi";
			temp.styleClass = org.mokylin.skin.app.tequan.button.ButtonChongzhi;
			temp.x = 560;
			temp.y = 91;
			return temp;
		}

		private function lbLv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLv = temp;
			temp.name = "lbLv";
			temp.text = "3";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 35;
			temp.x = 404;
			temp.y = 101;
			return temp;
		}

		private function lbPingtai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPingtai = temp;
			temp.name = "lbPingtai";
			temp.text = "点击了解更多平台VIP规则";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 533;
			temp.y = 6;
			return temp;
		}

		private function listCont_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listCont = temp;
			temp.name = "listCont";
			temp.height = 368;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 704;
			temp.x = 0;
			temp.y = 131;
			return temp;
		}

	}
}