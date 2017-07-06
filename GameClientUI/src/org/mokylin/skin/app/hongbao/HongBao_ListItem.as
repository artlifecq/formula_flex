package org.mokylin.skin.app.hongbao
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
	public class HongBao_ListItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var lbHand:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbType:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_ListItem()
		{
			super();
			
			this.currentState = "normal";
			this.height = 33;
			this.width = 619;
			this.elementsContent = [bg1_i(),bg2_i(),lbName_i(),lbType_i(),lbHand_i()];
			
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
			temp.height = 33;
			temp.styleName = "ui/common/titilebg/ItemBg.png";
			temp.width = 619;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.height = 33;
			temp.styleName = "ui/common/titilebg/ItemBghei.png";
			temp.width = 619;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbHand_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHand = temp;
			temp.name = "lbHand";
			temp.text = "明日领取";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 100;
			temp.x = 465;
			temp.y = 9;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "超级无敌瀚文";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 152;
			temp.x = 38;
			temp.y = 9;
			return temp;
		}

		private function lbType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbType = temp;
			temp.name = "lbType";
			temp.text = "在线";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 100;
			temp.x = 267;
			temp.y = 9;
			return temp;
		}

	}
}