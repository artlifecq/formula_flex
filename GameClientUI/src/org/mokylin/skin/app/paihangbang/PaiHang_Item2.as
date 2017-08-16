package org.mokylin.skin.app.paihangbang
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
	public class PaiHang_Item2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon:feathers.controls.UIAsset;

		public var lbContent:feathers.controls.Label;

		public var lbLevel:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbZhiye:feathers.controls.Label;

		public var uiOver:feathers.controls.UIAsset;

		public var vip:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHang_Item2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.width = 546;
			this.elementsContent = [__PaiHang_Item2_UIAsset1_i(),icon_i(),vip_i(),lbName_i(),lbLevel_i(),lbZhiye_i(),lbContent_i(),lbNum_i()];
			uiOver_i();
			
			
			states = {
			};
			skinNames={"down":"ui/common/hover/liangkuang2.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PaiHang_Item2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
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
			temp.x = 31;
			temp.y = 2;
			return temp;
		}

		private function lbContent_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbContent = temp;
			temp.name = "lbContent";
			temp.text = "羽化乾坤·13阶2星";
			temp.textAlign = "center";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 401;
			temp.y = 6;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "999";
			temp.textAlign = "center";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 68;
			temp.x = 243;
			temp.y = 6;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "姓名六个字的";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 97;
			temp.x = 122;
			temp.y = 6;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "3";
			temp.textAlign = "center";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 43;
			temp.x = 23;
			temp.y = 5;
			return temp;
		}

		private function lbZhiye_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhiye = temp;
			temp.name = "lbZhiye";
			temp.text = "兵家";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 42;
			temp.x = 340;
			temp.y = 6;
			return temp;
		}

		private function uiOver_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOver = temp;
			temp.name = "uiOver";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/hover/liangkuang2.png";
			temp.top = 0;
			return temp;
		}

		private function vip_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			vip = temp;
			temp.name = "vip";
			temp.styleName = "ui/common/tubiao/vips1.png";
			temp.x = 89;
			temp.y = 4;
			return temp;
		}

	}
}