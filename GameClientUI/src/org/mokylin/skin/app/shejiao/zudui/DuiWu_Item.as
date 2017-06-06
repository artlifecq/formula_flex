package org.mokylin.skin.app.shejiao.zudui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.shejiao.zudui.BtnSelect_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DuiWu_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var lbLevel:feathers.controls.Label;

		public var lbMap:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;

		public var rdoSelect:feathers.controls.Button;

		public var selectBg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuiWu_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 23;
			this.width = 894;
			this.elementsContent = [bg1_i(),bg2_i(),selectBg_i(),lbName_i(),lbLevel_i(),lbZhanli_i(),lbNum_i(),lbMap_i(),rdoSelect_i()];
			
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
			temp.height = 23;
			temp.styleName = "ui/common/titilebg/ItemBg.png";
			temp.width = 894;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.height = 23;
			temp.styleName = "ui/common/titilebg/ItemBghei.png";
			temp.width = 894;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "90级";
			temp.textAlign = "center";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 111;
			temp.x = 247;
			temp.y = 2;
			return temp;
		}

		private function lbMap_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMap = temp;
			temp.name = "lbMap";
			temp.text = "马贼营寨";
			temp.textAlign = "center";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 148;
			temp.x = 739;
			temp.y = 2;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "【320000】角色名六个字";
			temp.textAlign = "center";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 187;
			temp.x = 34;
			temp.y = 2;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "1/5";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 83;
			temp.x = 635;
			temp.y = 2;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.text = "11114228527752";
			temp.textAlign = "center";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 212;
			temp.x = 384;
			temp.y = 2;
			return temp;
		}

		private function rdoSelect_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			rdoSelect = temp;
			temp.name = "rdoSelect";
			temp.height = 32;
			temp.styleClass = org.mokylin.skin.app.shejiao.zudui.BtnSelect_Skin;
			temp.width = 894;
			temp.x = 0;
			temp.y = -4;
			return temp;
		}

		private function selectBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			selectBg = temp;
			temp.name = "selectBg";
			temp.styleName = "ui/app/shejiao/zudui/xuanzhongtiao.png";
			temp.width = 894;
			temp.x = 0;
			temp.y = -4;
			return temp;
		}

	}
}