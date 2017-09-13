package org.mokylin.skin.app.fulidating
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Item_Qiandao extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var lbDate:feathers.controls.Label;

		public var uiBuqian:feathers.controls.UIAsset;

		public var uiJin:feathers.controls.UIAsset;

		public var uiOK:feathers.controls.UIAsset;

		public var uiTiqian:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Item_Qiandao()
		{
			super();
			
			this.currentState = "normal";
			this.height = 51;
			this.width = 87;
			this.elementsContent = [bg1_i(),bg2_i(),lbDate_i(),uiOK_i(),uiBuqian_i(),uiTiqian_i(),uiJin_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg1 = temp;
			temp.name = "bg1";
			temp.styleName = "ui/app/fulidating/qddi.png";
			temp.x = 11;
			temp.y = 10;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.styleName = "ui/app/fulidating/qddiliang.png";
			temp.x = 11;
			temp.y = 10;
			return temp;
		}

		private function lbDate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDate = temp;
			temp.name = "lbDate";
			temp.fontSize = 16;
			temp.text = "21";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 41;
			temp.x = 30;
			temp.y = 21;
			return temp;
		}

		private function uiBuqian_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBuqian = temp;
			temp.name = "uiBuqian";
			temp.styleName = "ui/app/fulidating/word/bq.png";
			temp.x = 47;
			temp.y = 19;
			return temp;
		}

		private function uiJin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJin = temp;
			temp.name = "uiJin";
			temp.styleName = "ui/app/fulidating/jin.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiOK_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOK = temp;
			temp.name = "uiOK";
			temp.styleName = "ui/app/fulidating/gou.png";
			temp.x = 64;
			temp.y = 26;
			return temp;
		}

		private function uiTiqian_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTiqian = temp;
			temp.name = "uiTiqian";
			temp.styleName = "ui/app/fulidating/word/tqq.png";
			temp.x = 47;
			temp.y = 19;
			return temp;
		}

	}
}