package app.message {
	public final class Quality {
		public static const WHITE:int = 0;
		public static const GREEN:int = 1;
		public static const BLUE:int = 2;
		public static const PURPLE:int = 3;
		public static const YELLOW:int = 4;
		public static const RED:int = 5;
		
		private static var qualityStyles:Array=["Q_quality_lv","Q_quality_lan","Q_quality_zi","Q_quality_huang","Q_quality_hong"];
		
		public static function getQualityStyleName(q:int):String
		{
			if(q<1||q>qualityStyles.length){
				return null;
			}
			return "UIMovieClip"+qualityStyles[q-1];
		}
	}
}
