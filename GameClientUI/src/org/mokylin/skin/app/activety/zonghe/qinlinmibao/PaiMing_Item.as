package org.mokylin.skin.app.activety.zonghe.qinlinmibao
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
	public class PaiMing_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbName:feathers.controls.Label;

		public var lbNo:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var uiMy:feathers.controls.UIAsset;

		public var uiOver:feathers.controls.UIAsset;

		public var uiSelect:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiMing_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 23;
			this.width = 246;
			this.elementsContent = [lbNo_i(),lbName_i(),lbNum_i(),uiMy_i(),uiSelect_i(),uiOver_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "[9999区]玩家名六个字";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 145;
			temp.x = 31;
			temp.y = 2;
			return temp;
		}

		private function lbNo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNo = temp;
			temp.name = "lbNo";
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 49;
			temp.x = -6;
			temp.y = 2;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "250024";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 70;
			temp.x = 177;
			temp.y = 2;
			return temp;
		}

		private function uiMy_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiMy = temp;
			temp.name = "uiMy";
			temp.height = 23;
			temp.styleName = "ui/common/hover/bossSelect.png";
			temp.width = 246;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiOver_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOver = temp;
			temp.name = "uiOver";
			temp.height = 23;
			temp.styleName = "ui/common/hover/bossOver.png";
			temp.width = 246;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSelect = temp;
			temp.name = "uiSelect";
			temp.height = 23;
			temp.styleName = "ui/common/hover/bossOver.png";
			temp.width = 246;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}