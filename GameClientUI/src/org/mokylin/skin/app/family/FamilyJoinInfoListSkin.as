package org.mokylin.skin.app.family
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyJoinInfoListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgEff:feathers.controls.UIAsset;

		public var labHeadName:feathers.controls.Label;

		public var labLevel:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labPopleCount:feathers.controls.Label;

		public var labState:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyJoinInfoListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 500;
			this.elementsContent = [imgEff_i(),labState_i(),labName_i(),labHeadName_i(),labLevel_i(),labPopleCount_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgEff_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgEff = temp;
			temp.name = "imgEff";
			temp.height = 25;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 500;
			temp.x = -1;
			temp.y = 2;
			return temp;
		}

		private function labHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labHeadName = temp;
			temp.name = "labHeadName";
			temp.text = "家族族长";
			temp.textAlign = "center";
			temp.width = 100;
			temp.x = 237;
			temp.y = 6;
			return temp;
		}

		private function labLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLevel = temp;
			temp.name = "labLevel";
			temp.text = "家族等级";
			temp.textAlign = "center";
			temp.x = 358;
			temp.y = 6;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.text = "家庭名称";
			temp.textAlign = "center";
			temp.width = 100;
			temp.x = 133;
			temp.y = 6;
			return temp;
		}

		private function labPopleCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPopleCount = temp;
			temp.name = "labPopleCount";
			temp.text = "家族人数";
			temp.textAlign = "center";
			temp.x = 423;
			temp.y = 6;
			return temp;
		}

		private function labState_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labState = temp;
			temp.name = "labState";
			temp.text = "招募状态";
			temp.textAlign = "center";
			temp.width = 120;
			temp.x = 5;
			temp.y = 6;
			return temp;
		}

	}
}