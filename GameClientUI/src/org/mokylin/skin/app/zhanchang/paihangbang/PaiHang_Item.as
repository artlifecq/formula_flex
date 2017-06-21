package org.mokylin.skin.app.zhanchang.paihangbang
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
	public class PaiHang_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var bg3:feathers.controls.UIAsset;

		public var lbId:feathers.controls.Label;

		public var lbJifen:feathers.controls.Label;

		public var lbLevel:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var uiVip:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHang_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 386;
			this.elementsContent = [bg1_i(),bg2_i(),bg3_i(),lbId_i(),lbName_i(),lbLevel_i(),lbJifen_i(),uiVip_i()];
			
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
			temp.styleName = "ui/app/zhanchang/paihangbang/liebiao_hui.png";
			temp.width = 386;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.styleName = "ui/app/zhanchang/paihangbang/liebiao_hei.png";
			temp.width = 386;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg3 = temp;
			temp.name = "bg3";
			temp.styleName = "ui/app/zhanchang/paihangbang/liebiao_zong.png";
			temp.width = 386;
			temp.x = 0;
			temp.y = 0;
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
			temp.x = 0;
			temp.y = 4;
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
			temp.width = 52;
			temp.x = 328;
			temp.y = 4;
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
			temp.width = 74;
			temp.x = 238;
			temp.y = 4;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.height = 19;
			temp.text = "【1000区】玩家名六个字";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 159;
			temp.x = 47;
			temp.y = 4;
			return temp;
		}

		private function uiVip_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiVip = temp;
			temp.name = "uiVip";
			temp.styleName = "ui/app/zhanchang/paihangbang/vip.png";
			temp.x = 34;
			temp.y = 5;
			return temp;
		}

	}
}