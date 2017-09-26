package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.activety.number.UINumberPaimingshuzi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiXianTiaoZhan_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var grpNo:feathers.controls.Group;

		public var lbName:feathers.controls.Label;

		public var lbNo:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var numZhanli:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianTiaoZhan_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 303;
			this.elementsContent = [bg1_i(),bg2_i(),grpNo_i(),lbNo_i(),lbName_i(),lbNum_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiXianTiaoZhan_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg1 = temp;
			temp.name = "bg1";
			temp.height = 32;
			temp.styleName = "ui/common/titilebg/ItemBghei.png";
			temp.width = 303;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.height = 32;
			temp.styleName = "ui/common/titilebg/ItemBg.png";
			temp.width = 303;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpNo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpNo = temp;
			temp.name = "grpNo";
			temp.x = 23;
			temp.y = 2;
			temp.elementsContent = [__JiXianTiaoZhan_Item_UIAsset1_i(),numZhanli_i()];
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 14;
			temp.text = "[9999区]玩家名称六字";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 155;
			temp.x = 67;
			temp.y = 7;
			return temp;
		}

		private function lbNo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNo = temp;
			temp.name = "lbNo";
			temp.fontSize = 14;
			temp.text = "10";
			temp.textAlign = "center";
			temp.color = 0xEFD872;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 30;
			temp.x = 20;
			temp.y = 7;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.fontSize = 14;
			temp.text = "662111W";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 88;
			temp.x = 214;
			temp.y = 7;
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
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberPaimingshuzi;
			temp.width = 22;
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

	}
}