package org.mokylin.skin.app.beibao.zhangong
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
	public class MapItem_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var grp_dengji:feathers.controls.Group;

		public var lbBuzu:feathers.controls.Label;

		public var lbMsg:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var uiOver:feathers.controls.UIAsset;

		public var uiSelect:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MapItem_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 75;
			this.width = 223;
			this.elementsContent = [bg_i(),uiSelect_i(),uiOver_i(),lbMsg_i(),grp_dengji_i(),lbBuzu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MapItem_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/yuan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/beibao/zhangong/name/wujiabao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_dengji_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_dengji = temp;
			temp.name = "grp_dengji";
			temp.x = 198;
			temp.y = 8;
			temp.elementsContent = [__MapItem_Skin_UIAsset1_i(),lbNum_i()];
			return temp;
		}

		private function lbBuzu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBuzu = temp;
			temp.name = "lbBuzu";
			temp.text = "等级不足";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 157;
			temp.y = 8;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.letterSpacing = 1;
			temp.text = "8%";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 4;
			temp.y = 55;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.fontSize = 14;
			temp.text = "5";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 19;
			temp.x = -1;
			temp.y = -1;
			return temp;
		}

		private function uiOver_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOver = temp;
			temp.name = "uiOver";
			temp.height = 75;
			temp.styleName = "ui/app/beibao/zhangong/select.png";
			temp.width = 223;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSelect = temp;
			temp.name = "uiSelect";
			temp.height = 75;
			temp.styleName = "ui/app/beibao/zhangong/select.png";
			temp.width = 223;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}