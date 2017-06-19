package org.mokylin.skin.app.zhanchang.jiucengyaota
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberPaimingshuzi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiFenPaiHang_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpNo:feathers.controls.Group;

		public var lbName:feathers.controls.Label;

		public var lbNo:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var numZhanli:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiFenPaiHang_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 276;
			this.elementsContent = [grpNo_i(),lbNo_i(),lbName_i(),lbNum_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiFenPaiHang_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpNo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpNo = temp;
			temp.name = "grpNo";
			temp.x = 22;
			temp.y = 2;
			temp.elementsContent = [__JiFenPaiHang_Item_UIAsset1_i(),numZhanli_i()];
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 12;
			temp.text = "s1223 狼来了";
			temp.textAlign = "left";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 109;
			temp.x = 74;
			temp.y = 9;
			return temp;
		}

		private function lbNo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNo = temp;
			temp.name = "lbNo";
			temp.fontSize = 12;
			temp.text = "10";
			temp.textAlign = "center";
			temp.color = 0xEFD872;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 30;
			temp.x = 19;
			temp.y = 9;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.fontSize = 12;
			temp.text = "662111";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 61;
			temp.x = 210;
			temp.y = 9;
			return temp;
		}

		private function numZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhanli = temp;
			temp.name = "numZhanli";
			temp.gap = 0;
			temp.height = 25;
			temp.label = "1";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberPaimingshuzi;
			temp.width = 22;
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

	}
}