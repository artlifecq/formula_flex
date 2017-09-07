package org.mokylin.skin.app.activety.shijieboss
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
	public class ShangHai_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var lbKillNum:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNo:feathers.controls.Label;

		public var uiBaoxiang:feathers.controls.UIAsset;

		public var uiNo:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShangHai_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 298;
			this.elementsContent = [bg1_i(),bg2_i(),lbNo_i(),lbName_i(),lbKillNum_i(),uiNo_i(),uiBaoxiang_i()];
			
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
			temp.height = 27;
			temp.styleName = "ui/common/table/list1.png";
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.height = 27;
			temp.styleName = "ui/common/table/list.png";
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbKillNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbKillNum = temp;
			temp.name = "lbKillNum";
			temp.height = 17;
			temp.text = "52.5万(98.55%)";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 107;
			temp.x = 172;
			temp.y = 6;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "[9999区]玩家名六个字";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 150;
			temp.x = 27;
			temp.y = 6;
			return temp;
		}

		private function lbNo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNo = temp;
			temp.name = "lbNo";
			temp.text = "10";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 22;
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function uiBaoxiang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBaoxiang = temp;
			temp.name = "uiBaoxiang";
			temp.styleName = "ui/app/activety/shijieboss/icon/1.png";
			temp.x = 274;
			temp.y = 1;
			return temp;
		}

		private function uiNo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiNo = temp;
			temp.name = "uiNo";
			temp.styleName = "ui/app/activety/shijieboss/number/1.png";
			temp.x = 9;
			temp.y = 4;
			return temp;
		}

	}
}