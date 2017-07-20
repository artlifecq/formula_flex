package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.progress.pro_renwu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RenWu_jindu extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var pro_jindu:feathers.controls.ProgressBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenWu_jindu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 196;
			this.elementsContent = [__RenWu_jindu_UIAsset1_i(),pro_jindu_i(),labelDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RenWu_jindu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/skin_renwu/jdt_di.png";
			temp.width = 196;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.text = "80%";
			temp.textAlign = "center";
			temp.color = 0xEEEEEE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 57;
			temp.x = 71;
			temp.y = 0;
			return temp;
		}

		private function pro_jindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jindu = temp;
			temp.name = "pro_jindu";
			temp.height = 10;
			temp.styleClass = org.mokylin.skin.component.progress.pro_renwu;
			temp.value = 80;
			temp.width = 178;
			temp.x = 9;
			temp.y = 5;
			return temp;
		}

	}
}