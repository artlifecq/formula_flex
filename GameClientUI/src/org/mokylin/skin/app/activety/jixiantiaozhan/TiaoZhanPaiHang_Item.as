package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.activety.number.UINumberTiaozhanpaihang;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TiaoZhanPaiHang_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var gRank:feathers.controls.Group;

		public var ico1:feathers.controls.UIAsset;

		public var num:feathers.controls.UINumber;

		public var uiTitle1:feathers.controls.UIAsset;

		public var uiTitle2:feathers.controls.UIAsset;

		public var uiTitle3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TiaoZhanPaiHang_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 102;
			this.width = 304;
			this.elementsContent = [__TiaoZhanPaiHang_Item_UIAsset1_i(),uiTitle1_i(),gRank_i(),num_i(),ico1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TiaoZhanPaiHang_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/jixiantiaozhan/tiao2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function gRank_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gRank = temp;
			temp.name = "gRank";
			temp.x = 176;
			temp.y = 7;
			temp.elementsContent = [uiTitle2_i(),uiTitle3_i()];
			return temp;
		}

		private function ico1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico1 = temp;
			temp.name = "ico1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 26;
			temp.y = 34;
			return temp;
		}

		private function num_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num = temp;
			temp.name = "num";
			temp.gap = 0;
			temp.height = 25;
			temp.label = "1-10";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberTiaozhanpaihang;
			temp.width = 26;
			temp.x = 126;
			temp.y = 8;
			return temp;
		}

		private function uiTitle1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTitle1 = temp;
			temp.name = "uiTitle1";
			temp.styleName = "ui/app/activety/jixiantiaozhan/di.png";
			temp.x = 105;
			temp.y = 7;
			return temp;
		}

		private function uiTitle2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTitle2 = temp;
			temp.name = "uiTitle2";
			temp.styleName = "ui/app/activety/jixiantiaozhan/ming.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiTitle3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTitle3 = temp;
			temp.name = "uiTitle3";
			temp.styleName = "ui/app/activety/jixiantiaozhan/jiangli.png";
			temp.x = 22;
			temp.y = 0;
			return temp;
		}

	}
}