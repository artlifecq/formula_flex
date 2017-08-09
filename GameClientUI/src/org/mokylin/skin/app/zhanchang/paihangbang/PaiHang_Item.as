package org.mokylin.skin.app.zhanchang.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.paihangbang.ZhanChangPaiHangBtn;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHang_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var icon:feathers.controls.UIAsset;

		public var lbId:feathers.controls.Label;

		public var lbJifen:feathers.controls.Label;

		public var lbLevel:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var rdoSelect:feathers.controls.Button;

		public var selectBg:feathers.controls.UIAsset;

		public var uiVip:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHang_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.width = 545;
			this.elementsContent = [bg1_i(),icon_i(),lbId_i(),lbName_i(),lbLevel_i(),lbJifen_i(),uiVip_i(),selectBg_i(),rdoSelect_i()];
			
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
			temp.styleName = "ui/common/titilebg/list.png";
			temp.width = 545;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/paihangbang/1.png";
			temp.x = 33;
			temp.y = 2;
			return temp;
		}

		private function lbId_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbId = temp;
			temp.name = "lbId";
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 40;
			temp.x = 26;
			temp.y = 7;
			return temp;
		}

		private function lbJifen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJifen = temp;
			temp.name = "lbJifen";
			temp.text = "3244";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 58;
			temp.x = 443;
			temp.y = 6;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "钻石四阶";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 102;
			temp.x = 300;
			temp.y = 6;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.height = 19;
			temp.text = "[1000区]玩家名六个字";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 159;
			temp.x = 149;
			temp.y = 6;
			return temp;
		}

		private function rdoSelect_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			rdoSelect = temp;
			temp.name = "rdoSelect";
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.app.zhanchang.paihangbang.ZhanChangPaiHangBtn;
			temp.width = 545;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function selectBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			selectBg = temp;
			temp.name = "selectBg";
			temp.height = 30;
			temp.styleName = "ui/app/zhanchang/paihangbang/select.png";
			temp.width = 545;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiVip_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiVip = temp;
			temp.name = "uiVip";
			temp.styleName = "ui/common/tubiao/vips1.png";
			temp.x = 112;
			temp.y = 5;
			return temp;
		}

	}
}