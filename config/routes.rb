InitCareer::Engine.routes.draw do

	root 'careers#index'

 	# outer routes
	get 'careers_list' => 'careers#careers_list', as: 'careers_list'
  	get 'career/apply/:id' => 'careers#career_apply', as: 'career_apply'
  	post 'career/apply/:id' => 'careers#career_submission', as: 'career_submission'
  	
	# Admin Routes
	resources :careers
	get 'career/:id/submissions' => 'careers#submissions', as: 'submissions_list'
 	get 'submission/:career_submission_id' => 'careers#submission_detail', as: 'submission_detail'
  	get 'career_question' => 'careers#career_question', as: 'career_question'
end
