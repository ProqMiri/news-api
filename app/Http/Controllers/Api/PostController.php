<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\PostRequest;
use App\Models\Comment;
use App\Models\Post;
use Illuminate\Support\Str;

/**
 * Class PostController
 * @package App\Http\Controllers\Api
 */

class PostController extends Controller
{
    /**
     * Get All posts
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index ():\Illuminate\Http\JsonResponse {
        return response()->json([
            'success' => [
                'message' => 'Successfully',
                'data' => [
                    'posts' => Post::paginate(20)
                ]
            ]
        ]);
    }

    /**
     * Store a post
     *
     * @param  \App\Http\Requests\PostRequest $postRequest
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(PostRequest $postRequest):\Illuminate\Http\JsonResponse {
        $post = new Post();
        $post->title = $postRequest->title;
        $post->author_name = $postRequest->author_name;
        $post->slug = Str::slug($postRequest->title) . '-'. uniqid();
        $post->save();
        return response()->json([
            'success' => [
                'message' => 'Successfully!'
            ]
        ]);
    }

    /**
     * Retrieve post by id
     *
     * @param  int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function detail (int $id):\Illuminate\Http\JsonResponse {
        return response()->json([
            'success' => [
                'message' => 'Successfully!',
                'data' => [
                    'post' => Post::find($id),
                    'comments' => Comment::where('post_id', $id)->get()
                ]
            ]
        ]);
    }

    /**
     * Increase upvote one by one within id
     *
     * @param  int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function upvote (int $id):\Illuminate\Http\JsonResponse {
        $post = Post::find($id);
        $post->upvotes++;
        $post->save();
        return response()->json([
            'success' => [
                'message' => 'Successfully!'
            ]
        ]);
    }
}
